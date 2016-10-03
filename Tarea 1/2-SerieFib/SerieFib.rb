clinum = ARGV[0].to_i
def SerieFib(num)
  numeroPrev = 0
  numeroActu = 1
  resultado = 0
  while (numeroActu <= num)
      if (numeroActu % 2 != 0)
          resultado += numeroActu
      end

      numeroActu += numeroPrev
      numeroPrev = numeroActu - numeroPrev
  end
  return resultado
end
printf(SerieFib(clinum).to_s)


