def calculate_wer(ref, hyp):
    ref_words = ref.lower().split()
    hyp_words = hyp.lower().split()
    
    # Create a matrix to hold the distances
    d = [[0] * (len(hyp_words) + 1) for _ in range(len(ref_words) + 1)]
    
    # Initialize the matrix
    for i in range(len(ref_words) + 1):
        d[i][0] = i
    for j in range(len(hyp_words) + 1):
        d[0][j] = j
    
    # Populate the matrix
    for i in range(1, len(ref_words) + 1):
        for j in range(1, len(hyp_words) + 1):
            if ref_words[i - 1] == hyp_words[j - 1]:
                cost = 0
            else:
                cost = 1
            d[i][j] = min(d[i - 1][j] + 1,     # Deletion
                          d[i][j - 1] + 1,     # Insertion
                          d[i - 1][j - 1] + cost) # Substitution
    
    # WER is the value in the bottom right corner of the matrix
    wer = d[len(ref_words)][len(hyp_words)] / len(ref_words)
    return wer

# Define the reference and hypothesis
reference_text = "hello how are you doing"


hypothesis_text = "H e l o  how  a  you  doing"

# Calculate WER
wer = calculate_wer(reference_text, hypothesis_text)
print("result :", wer)
