def solution():
    # 1 digit
    l1 = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
    d1 = len(combine_words(l1))

    # 2 digits
    l2 = ['twenty', 'thirty', 'fourty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety']
    l3 = ['ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']
    d2 = len(combine_words(l2)) + d1*len(l2) + len(combine_words(l2))*(len(l1)+1)

    # 3 digits
    w1 = 'hundred'
    w2 = 'and'
    d3 = len(w1)*900 + d1*100 + len(w2)*9*99 + 9*d2

    # 4 digits
    w3 = 'thousand'
    d4 = len(w3)

    return d1 + d2 + d3 + d4

def combine_words(words):
    w = ''
    for word in words:
        w += word
    return w

# solved by chatGPT
print(solution())
