miArreglo = [ 2, 3, 2, 54, 32, 8, 6, 11, 18, 20]
miArregloOrd = [ 1, 4, 10, 15, 22, 23, 34, 58, 59, 60, 88]

def BusqSec(arreglo, key)
  for i in 0..arreglo.length
    if arreglo[i] == key
      return i
    end
  end
end
def BusqBin(arreglo, key)
  midindx = (arreglo.length)/2
  if arreglo[midindx] > key
    for i in 0..midindx
      if arreglo[i] == key
        return i
      end
    end
  else
    for i in midindx..arreglo.length
      if arreglo[i] == key
        return i
      end
    end
  end
end

puts BusqSec(miArreglo,2)
puts BusqBin(miArregloOrd,58)