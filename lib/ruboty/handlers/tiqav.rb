require 'tiqav'

module Ruboty
  module Handlers
    class Tiqav < Base
      on /tiqav( me)? ?(?<keyword>.+)?/, name: 'tiqav', description: 'Get tiqav image matching with the keyword'

      def tiqav(message = {})
        keyword = message[:keyword]
        url = generate(keyword)

        return_message = url ? url : 'Cound not find tiqav image'

        message.reply(return_message)
      end

      private

      def generate(q)
        if q
          ::Tiqav.search(q).sample.url.to_s
        else
          ::Tiqav.random.url.to_s
        end
      end
    end
  end
end
