# @param {String} s
# @param {String} t
# @return {Boolean}
def is_isomorphic(s, t)
  transform(s) == transform(t)
end

def transform(str)
  hash = {}
  str.each_char.with_index.map do |ch, i|
    hash[ch] ||= i 
  end.join(' ')
end