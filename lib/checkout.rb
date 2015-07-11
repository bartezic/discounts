class Checkout
  def initialize(rules)
    @rules = rules
    @codes = []
  end

  def scan(code)
    @codes << code
  end

  def total
    total_amount - discount
  end

  def total_amount
    @codes.inject(0) do |sum, code|
      sum += PRODUCTS[code][:price]
    end
  end

  def discount
    @rules.inject(0) do |sum, rule|
      sum += Rule.send(rule[:name], rule[:pms].merge({codes: @codes}))
    end
  end
end