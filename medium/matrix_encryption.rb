def matrix_encryption(in_str)
  str = in_str.gsub(' ', '')
  str_sz = str.size
  sz = (str_sz ** 0.5).floor
  row_sz , col_sz = if sz * sz == str_sz # perfect square
                      [sz, sz]
                    else
                      if sz * (sz + 1) >= str_sz
                        [sz, sz + 1]
                      else
                        [sz + 1, sz + 1]
                      end
                    end
  matrix = Array.new(row_sz, Array.new(col_sz, ''))
  str = str + ' ' * (row_sz * col_sz - str_sz) # padding to fit the matrix size
  (0...row_sz).each { |r| matrix[r] = str[(r * col_sz)...((r + 1) * col_sz)].split('')}
  matrix.transpose.map(&:join).map(&:rstrip).join(' ')
end

p matrix_encryption('abc def ghi') # "adg beh cfi"
p matrix_encryption('haveaniceday') # "hae and via ecy"
p matrix_encryption('feedthedog') # "fto ehg ee dd"
p matrix_encryption('chillout') # "clu hlt io"
