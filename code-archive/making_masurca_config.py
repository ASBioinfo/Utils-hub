import os

base_dir = "out"

skip_dirs = "male_sample"

for folder_name in os.listdir(base_dir):
    folder_path = os.path.join(base_dir, folder_name)
    
    if not os.path.isdir(folder_path) or folder_name == skip_dirs:
        continue
    
    masurca_dir = os.path.join(folder_path, "masurca_analysis")
    
    os.makedirs(masurca_dir, exist_ok=True)
    
    config_file = os.path.join(masurca_dir, "masurca_config.txt")
    
    with open(config_file, "w") as f:
        f.write(f"""DATA
PE= pe 350 50 ../{folder_name}_mateUnmapped_R1.fq ../{folder_name}_mateUnmapped_R2.fq
PE= s1 350 50 ../{folder_name}_R1_matemap.fq
PE= s2 350 50 ../{folder_name}_R2_matemap.fq
REFERENCE= ./empty.fna
END

PARAMETERS
GRAPH_KMER_SIZE=auto
USE_LINKING_MATES=1
KMER_COUNT_THRESHOLD=1
NUM_THREADS=60
JF_SIZE=2000000000
DO_HOMOPOLYMER_TRIM=0
END
""")
    
    print(f"Created {config_file}")
