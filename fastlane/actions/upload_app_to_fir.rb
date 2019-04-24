module Fastlane
  module Actions
    module SharedValues
      UPLOAD_APP_TO_FIR_CUSTOM_VALUE = :UPLOAD_APP_TO_FIR_CUSTOM_VALUE
    end

    class UploadAppToFirAction < Action
      def self.run(params)
        # fastlane will take care of reading in the parameter and fetching the environment variable:
        unless params[:file_path] and params[:app_key]
        UI.message("xiong die 👱 file_path or app_key can not be empty")
        end
        Action.sh "fir p #{params[:file_path]} -T #{params[:app_key]}"
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "人在江湖"
      end

      def self.details
        # Optional:
        # this is your chance to provide a more detailed description of this action
        "发布ipa 到蒲公英"
      end

      def self.available_options
        # Define all options your action supports. 
        
        # Below a few examples
        [
        FastlaneCore::ConfigItem.new(key: :file_path,
                                     description: "App path", # a short description of this parameter
                                     is_string: true
                                     ),
        FastlaneCore::ConfigItem.new(key: :app_key,
                                     description: "Fir key",
                                     is_string: true
                                     ) # the default value if the user didn't provide one
        ]
      end

      def self.output
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.authors
        # So no one will ever forget your contribution to fastlane :) You are awesome btw!
        ["CaiXiang"]
      end

      def self.is_supported?(platform)
        # you can do things like
        # 
        #  true
        # 
        #  platform == :ios
        # 
        #  [:ios, :mac].include?(platform)
        # 

        platform == :ios
      end
    end
  end
end
