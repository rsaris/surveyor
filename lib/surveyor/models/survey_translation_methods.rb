# frozen_string_literal: true

module Surveyor
  module Models
    module SurveyTranslationMethods
      extend ActiveSupport::Concern
      include ActiveModel::Validations
      include ActiveModel::ForbiddenAttributesProtection

      included do
        # Associations
        belongs_to :survey, optional: true

        if defined? ActiveModel::MassAssignmentSecurity
          attr_accessible *PermittedParams.new.survey_translation_attributes
        end

        # Validations
        validates_presence_of :locale, :translation
        validates_uniqueness_of :locale, scope: :survey_id
      end

      # Instance Methods
      def initialize(*args)
        super(*args)
        default_args
      end

      def default_args; end
    end
  end
end
