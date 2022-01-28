class HomeController < ApplicationController

	before_action :check_post_code, only: [:search_code]

	def home
	end

	def search_code
		
		checker = PostCodeChecker.new(search_params[:post_code])

		if checker.valid?
			@result = checker.search_code
		else
			flash[:error] = "Invalid Postcode"
		end		

		render "result"
	end

	def result
	end

	private

	def search_params
		params.require(:search).permit(:post_code)
	end

	def check_post_code

	end


end
