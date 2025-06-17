import os
import json
import pandas as pd
import sys

def extract_summary_data(file_list_path):
    data = []
    with open(file_list_path, 'r') as f:
        json_files = [line.strip() for line in f if line.strip()]

    for file_path in json_files:
        sample_name = os.path.splitext(os.path.basename(file_path))[0].split('_report')[0]

        with open(file_path, 'r') as file:
            json_data = json.load(file)

        summary = json_data.get('summary', {})
        before = summary.get('before_filtering', {})
        after = summary.get('after_filtering', {})

        row = {
            "Sample_Name": sample_name,
            "Before_Total_Reads": before.get('total_reads', None),
            "Before_Total_Bases": before.get('total_bases', None),
            #"Before_Q20_Bases": before.get('q20_bases', None),
            #"Before_Q30_Bases": before.get('q30_bases', None),
            "Before_Q20_Rate(%)": round(before.get('q20_rate', None)*100,2),
            "Before_Q30_Rate(%)": round(before.get('q30_rate', None)*100,2),
            #"Before_Read1_Mean_Length": before.get('read1_mean_length', None),
            #"Before_Read2_Mean_Length": before.get('read2_mean_length', None),
            "Before_GC_Content(%)": round(before.get('gc_content', None)*100,2),
            "After_Total_Reads": after.get('total_reads', None),
            "After_Total_Bases": after.get('total_bases', None),
            #"After_Q20_Bases": after.get('q20_bases', None),
            #"After_Q30_Bases": after.get('q30_bases', None),
            "After_Q20_Rate(%)": round(after.get('q20_rate', None)*100,2),
            "After_Q30_Rate(%)": round(after.get('q30_rate', None)*100,2),
            #"After_Read1_Mean_Length": after.get('read1_mean_length', None),
            #"After_Read2_Mean_Length": after.get('read2_mean_length', None),
            "After_GC_Content": round(after.get('gc_content', None)*100,2),
        }
        data.append(row)

    return pd.DataFrame(data)


if len(sys.argv) != 2:
    print("Usage: python table.py <file_list.txt>")
    sys.exit(1)

file_list_path = sys.argv[1]
table = extract_summary_data(file_list_path)
#print(table)
table.to_csv(sys.stdout, index=False)
