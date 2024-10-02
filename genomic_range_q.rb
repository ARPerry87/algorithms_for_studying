def solution(s: "", p: [], q: [])
  res = []
  dna_length = s.size
  mapping = {"A": 1, "C": 2, "G": 3, "T": 4}
  next_nuc = [[-1] * dna_length, [-1] * dna_length, [-1] * dna_length, [-1] * dna_length]
  next_nuc[mapping[s[-1].to_sym] - 1][-1] = dna_length - 1

  for i in range(dna_length - 2, -1, -1)
    next_nuc[0][i] = next_nuc[0][i + 1]
    next_nuc[1][i] = next_nuc[1][i + 1]
    next_nuc[2][i] = next_nuc[2][i + 1]
    next_nuc[3][i] = next_nuc[3][i + 1]
    next_nuc[mapping[s[i].to_sym] - 1][i] = i
  end

  for i in range(0, p.size)
    if next_nuc[0][p[i]] != -1 && next_nuc[0][p[i]] <= q[i]
      res.append(1)
    elsif next_nuc[1][p[i]] != -1 && next_nuc[1][p[i]] <= q[i]
      res.append(2)
    elsif next_nuc[2][p[i]] != -1 && next_nuc[2][p[i]] <= q[i]
      res.append(3)
    else
      res.append(4)
    end
  end
  res
end