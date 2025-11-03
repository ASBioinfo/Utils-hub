def add_50_bp(file1, file2):
    seqs1 = {}

    with open(file1, 'r') as f1:
        for line in f1:
            line = line.strip()
            if line.startswith(">"):
                seq_id = line[1:]
                seqs1[seq_id] = ""
            else:
                seqs1[seq_id] += line

    seqs2 = {}

    with open(file2, 'r') as f2:
        for line in f2:
            line = line.strip()
            if line.startswith(">"):
                seq_id = line[1:]
                seqs2[seq_id] = ""
            else:
                seqs2[seq_id] += line

    for seq_id, seq in seqs1.items():
        if seq in seqs2.values():
            seqs1[seq_id] = seq + seqs2[seq_id][:50]

    #with open(file3, 'w') as f1:
        for seq_id, seq in seqs1.items():
            print(">" + seq_id + "\n" + seq + "\n")

add_50_bp("file1.fasta", "file2.fasta")