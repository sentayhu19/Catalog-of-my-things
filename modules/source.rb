require 'json'
require_relative 'menu.rb'

module SourceModule
  def add_source(source)
    source_storage = './json/sources.json'
    sources = []
    new_source = {
      'name' => source.name
    }

    sources = JSON.parse(File.read(source_storage)) if File.exist?(source_storage)
    sources << new_source
    File.write(source_storage, JSON.pretty_generate(sources))
  end

  def list_all_sources
    source_storage = './json/sources.json'
    sources = []

    if File.exist?(source_storage)
      if File.empty?(source_storage)
        sources
      else
        JSON.parse(File.read(source_storage))
      end
    else
      sources
    end
  end

  def list_sources
    sources = list_all_sources

    if sources.empty?
      puts 'Woops! There are currently no sources in the list.'
      menu_list
    else
      puts "#{sources.count} Sources Found!"
      sources.each do |source|
        puts "Title: '#{source.name}"
      end
    end
  end
end