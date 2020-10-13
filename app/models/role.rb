class Role < ApplicationRecord
  #encoding:utf-8
    STATUS = [
        OpenStruct.new(slug: "voice_actor",               description: "Dublador"),
        OpenStruct.new(slug: "director",                  description: "Diretor"),
        OpenStruct.new(slug: "vox_team",                  description: "Time de Suporte"),
        OpenStruct.new(slug: "producer",                  description: "Produtor")
    ]

    def self.default
      STATUS.select {|status| status.slug == "fixing"}.first.slug
    end

    def self.all
      STATUS
    end

    def self.fetch(slug)
      STATUS.select {|status| status.slug == slug}.first
    end

    def self.each
      STATUS.each do |status|
        yield status
      end
    end

    self.each do |status|
      define_singleton_method status.slug.to_sym do
        status.slug.to_s
      end
    end

end
