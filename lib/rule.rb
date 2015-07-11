class Rule
  def self.get_free(pms)
    pms[:items].inject(0) do |sum, item_code|
      # count similar
      sc = similar_count(pms[:codes], item_code)
      # count how many will be free
      free = sc/(pms[:buy]+pms[:get])*pms[:get]
      # calculate discount
      PRODUCTS[item_code][:price] * free
    end
  end

  def self.multi_discount(pms)
    pms[:items].inject(0) do |sum, item_code|
      sc = similar_count(pms[:codes], item_code)
      if (sc >= pms[:buy])
        (PRODUCTS[item_code][:price] / 100) * pms[:percent] * sc
      else
        0
      end
    end
  end

  private

    def self.similar_count(codes, item_code)
      codes.select{|code| code == item_code}.count
    end
end