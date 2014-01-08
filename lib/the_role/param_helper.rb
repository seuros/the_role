require "active_support/inflector"

module TheRole
  module Param
    def self.process param
      param.to_s.parameterize.underscore
    end

    def self.constantize constant
      constant.to_s.constantize
    end
  end
end
