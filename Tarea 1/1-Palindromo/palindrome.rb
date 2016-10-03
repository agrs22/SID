mistring = ARGV[0]
class String
  def espalindrome?
    mistring = self.downcase.scan(/\w/)
    mistring == mistring.reverse
  end
end
printf(mistring.espalindrome?.to_s)


