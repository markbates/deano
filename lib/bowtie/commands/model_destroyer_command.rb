module Bowtie
  class ModelDestroyer < Bowtie::NameCommand

    def self.command
      "destroy:model"
    end

    def self.help
      "model_name"
    end

    def call
      rm app_path("models", "#{self.underscored}.rb")
      rm app_path("spec", "models", "#{self.underscored}_spec.rb")
    end

  end
end