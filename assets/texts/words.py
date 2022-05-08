from gettext import translation
from translate import Translator


def transformToList():
    translator = Translator(from_lang="de", to_lang="en")

    f = open(r"C:\Users\main laptop\programation\\Algorithm Toolbox\week1_programming_challenges\2_maximum_pairwise_product\post.txt", "r")
    words = []
    nouns = []
    verbs = []
    o = "&"
    while(o):
        o = f.readline()
        line = o.split(" ")
        result = map(remove, line)
        words = list(result)
        translation = translator.translate(words[0])
        words.append(translation)
        if(words[0][0].isupper()):
            nouns.append(words)
        else:
            verbs.append(words)
    return nouns, words


def remove(word):
    a = word.replace(",", "")
    b = a.replace("\n", "")
    return b


def convertToClass(words):
    for word in words:

        print('Word("{}","{}","{}","{}"),'.format(
            word[3], word[0], word[1], word[2]))


a, b = transformToList()
print(a, b)
