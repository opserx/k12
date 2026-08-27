#!/usr/bin/env ruby
# frozen_string_literal: true

require "yaml"

ROOT = File.expand_path("..", __dir__)
SKILL_GLOB = File.join(ROOT, "skills", "*", "*", "SKILL.md")
START_MARKER = "<!-- current-skill-index:start -->"
END_MARKER = "<!-- current-skill-index:end -->"

def frontmatter(path)
  text = File.read(path)
  match = text.match(/\A---\s*\n(.*?)\n---/m)
  abort "Missing YAML frontmatter: #{path}" unless match

  YAML.safe_load(match[1], aliases: false) || {}
end

def required_string(value, label, path)
  return value if value.is_a?(String) && !value.empty?

  abort "Missing #{label}: #{path}"
end

def skill_entries
  Dir.glob(SKILL_GLOB).map do |path|
    data = frontmatter(path)
    name = required_string(data["name"], "name", path)
    directory_name = File.basename(File.dirname(path))
    abort "Skill name does not match directory: #{path}" unless name == directory_name

    index = data.dig("metadata", "index")
    abort "Missing metadata.index: #{path}" unless index.is_a?(Hash)

    visibility = index.fetch("visibility", "public")
    abort "Invalid metadata.index.visibility: #{path}" unless %w[public internal].include?(visibility)
    next if visibility == "internal"

    relative_path = path.delete_prefix("#{ROOT}/")
    {
      category: File.basename(File.dirname(File.dirname(path))),
      name: name,
      path: relative_path,
      summary_zh: required_string(index["summary_zh"], "metadata.index.summary_zh", path),
      summary_en: required_string(index["summary_en"], "metadata.index.summary_en", path),
      explicit: data["disable-model-invocation"] == true
    }
  end.compact.sort_by { |entry| [entry[:category], entry[:name]] }
end

def table(entries, language)
  if language == :zh
    lines = [
      "| 分类 | Skill | 用途 | 调用方式 |",
      "| --- | --- | --- | --- |"
    ]
    lines.concat(entries.map do |entry|
      invocation = entry[:explicit] ? "用户主动调用" : "可由用户或 Agent 调用"
      "| `#{entry[:category]}` | [`#{entry[:name]}`](./#{entry[:path]}) | #{entry[:summary_zh]} | #{invocation} |"
    end)
  else
    lines = [
      "| Category | Skill | Purpose | Invocation |",
      "| --- | --- | --- | --- |"
    ]
    lines.concat(entries.map do |entry|
      invocation = entry[:explicit] ? "Explicit user invocation" : "User or agent invocation"
      "| `#{entry[:category]}` | [`#{entry[:name]}`](./#{entry[:path]}) | #{entry[:summary_en]} | #{invocation} |"
    end)
  end

  lines.join("\n")
end

def updated_readme(path, generated_table)
  content = File.read(path)
  pattern = /#{Regexp.escape(START_MARKER)}\n.*?\n#{Regexp.escape(END_MARKER)}/m
  abort "Missing skill-index markers: #{path}" unless content.match?(pattern)

  content.sub(pattern, "#{START_MARKER}\n#{generated_table}\n#{END_MARKER}")
end

check_only = ARGV == ["--check"]
abort "Usage: ruby scripts/update-skill-index.rb [--check]" unless ARGV.empty? || check_only

entries = skill_entries
targets = {
  File.join(ROOT, "README.md") => table(entries, :zh),
  File.join(ROOT, "README.en.md") => table(entries, :en)
}

stale = false
targets.each do |path, generated_table|
  updated = updated_readme(path, generated_table)
  next if updated == File.read(path)

  stale = true
  if check_only
    warn "Skill index is stale: #{path}"
  else
    File.write(path, updated)
    puts "Updated #{path.delete_prefix("#{ROOT}/")}" 
  end
end

exit 1 if check_only && stale
