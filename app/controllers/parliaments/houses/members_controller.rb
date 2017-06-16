module Parliaments
  module Houses
    class MembersController < ApplicationController
      def index
        parliament_id = params[:parliament_id]
        house_id      = params[:house_id]

        @parliament, @house, @people, @letters = RequestHelper.filter_response_data(
        parliament_request.parliaments(parliament_id).houses(house_id).members,
        'http://id.ukpds.org/schema/ParliamentPeriod',
        'http://id.ukpds.org/schema/House',
        'http://id.ukpds.org/schema/Person',
        ::Grom::Node::BLANK
        )

        @parliament = @parliament.first
        @house      = @house.first
        @people     = @people.sort_by(:sort_name)
        @letters    = @letters.map(&:value)
      end

      def a_to_z
        parliament_id = params[:parliament_id]
        house_id      = params[:house_id]

        @parliament, @house, @letters = RequestHelper.filter_response_data(
        parliament_request.parliaments(parliament_id).houses(house_id).members,
        'http://id.ukpds.org/schema/ParliamentPeriod',
        'http://id.ukpds.org/schema/House',
        ::Grom::Node::BLANK
        )

        @parliament = @parliament.first
        @house      = @house.first
        @letters    = @letters.map(&:value)
      end

      def letters
        parliament_id = params[:parliament_id]
        house_id      = params[:house_id]
        letter        = params[:letter]

        @parliament, @house, @people, @letters = RequestHelper.filter_response_data(
        parliament_request.parliaments(parliament_id).houses(house_id).members(letter),
        'http://id.ukpds.org/schema/ParliamentPeriod',
        'http://id.ukpds.org/schema/House',
        'http://id.ukpds.org/schema/Person',
        ::Grom::Node::BLANK
        )

        @parliament = @parliament.first
        @house      = @house.first
        @people     = @people.sort_by(:sort_name)
        @letters    = @letters.map(&:value)
      end
    end
  end
end