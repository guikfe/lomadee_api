module LomadeeApi
  class Base
    include HTTParty

    def initialize(params = {})
      raise "You need to inform your :application_id" if params[:application_id].nil?

      @application_id = params[:application_id]
      @country = params[:country] || 'BR'

      sandbox = params[:sandbox] || false

      case sandbox
      when false
        self.class.base_uri "http://bws.buscape.com"
      else
        self.class.base_uri "http://sandbox.buscape.com"
      end

    end

    def products(category_id)
      @page = @totalpages = 1

      while @page <= @totalpages
        products = self.class.get("/service/findProductList/lomadee/#{@application_id}/#{@country}/", query: {categoryId: category_id, format: 'json', page: @page})
        
        @response = JSON.parse(products.body)
        @totalpages = @response['totalpages']
        @page += 1

        yield @response['product']
      end
    end

    def offers(product_id)
      @page = @totalpages = 1

      while @page <= @totalpages
        offers = self.class.get("/service/findOfferList/lomadee/#{@application_id}/#{@country}/", query: {productId: product_id, format: 'json', page: @page})

        @response = JSON.parse(offers.body)
        @totalpages = @response['totalpages']
        @page += 1

        yield @response['offer']
      end
    end
  end
end