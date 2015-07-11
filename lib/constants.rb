# DB

PRODUCTS = {
  'FR' => { name: 'Fruit Tea',    price: 3.11 },
  'SR' => { name: 'Strawberries', price: 5.00 },
  'CF' => { name: 'Coffee',       price: 11.23 },
  'AJ' => { name: 'Apple Juice',  price: 7.25 },
}

PROMOS = [
  {name: :get_free, pms: {buy: 1, get: 1, items: ['FR']}},
  {name: :multi_discount, pms: {buy: 3, percent: 10, items: ['SR']}}
]