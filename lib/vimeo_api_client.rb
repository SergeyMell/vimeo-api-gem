# Gem version
require 'vimeo_api_client/version'

# Configurations
require 'vimeo_api_client/configuration'
require 'vimeo_api_client/utils'

# Logger
require 'vimeo_api_client/logger'

# Resources
require 'vimeo_api_client/resource'
require 'vimeo_api_client/user'
require 'vimeo_api_client/video'
require 'vimeo_api_client/texttrack'
require 'vimeo_api_client/thumbnail'
require 'vimeo_api_client/language'
require 'vimeo_api_client/watchlater_video'
require 'vimeo_api_client/album'
require 'vimeo_api_client/portfolio'
require 'vimeo_api_client/category'

module Vimeo
  extend Configuration

  RESOURCES = %w(user video text_track language album resource category).freeze

  class << self

    include Utils

    RESOURCES.each do |resource|
      define_method resource do |resource_id = nil|
        klass_name(resource).new(resource_id)
      end
    end

    private

    def klass_name(resource)
      "Vimeo::#{snake_to_camel(resource)}".split('::').inject(Object) {|o, c| o.const_get c}
    end
  end

end
