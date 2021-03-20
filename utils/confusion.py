import numpy as np
import sys

# P = Predicted
# R = Real
#
# For class 1
#
#      P0 P1 P2 P3
#      __ __ __ __
# R0  |TN FP TN TN
# R1  |FN TP FN FN
# R2  |TN FP TN TN
# R3  |TN FP TN TN

def calc_accuracy(confusion):
    correct = 0
    incorrect = 0
    
    for x in range(confusion.shape[0]):
        for y in range(confusion.shape[1]):
            if x == y:
                correct += confusion[x][y]
            else:
                incorrect += confusion[x][y]
    
    return correct / (correct + incorrect)

# For class 1
# Precision is interested in TP FP
#
#      P0 P1 P2 P3
#      __ __ __ __
# R0  |   FP      
# R1  |   TP      
# R2  |   FP      
# R3  |   FP      
def calc_precision(confusion, attr):
    tp = 0
    fp = 0

    for i in range(confusion.shape[0]):
        j = attr
        if i == j:
            tp += confusion[i][j]
        else:
            fp += confusion[i][j]

    return tp / (tp + fp)

# For class 1
# Recall is interested in TP FN
#
#      P0 P1 P2 P3
#      __ __ __ __
# R0  |           
# R1  |FN TP FN FN
# R2  |           
# R3  |              
def calc_recall(confusion, attr):
    tp = 0
    fn = 0

    for j in range(confusion.shape[0]):
        i = attr
        if i == j:
            tp += confusion[i][j]
        else:
            fn += confusion[i][j]

    return tp / (tp + fn)

def calc_f1(confusion, attr):
    precision = calc_precision(confusion, attr)
    recall = calc_recall(confusion, attr)

    return (2 * precision * recall) / (precision + recall)

def calc_macro_avg(confusion, func):
    acc = 0
    for i in range(confusion.shape[0]):
        acc += func(confusion, i)

    return acc / confusion.shape[0]

def p(x):
    return "%.2f%%" % (x * 100)

def main():
    if len(sys.argv) < 2:
        raise Exception("Expected confusion matrix file path as first argument")

    path = sys.argv[1]
    with open(path, 'r') as file:
        lines = file.readlines()
        classes = lines[0].split()
        class_count = len(classes)
        confusion = np.zeros((class_count, class_count))

        for i in range(class_count):
            for j in range(class_count):
                confusion[i][j] = lines[i + 1].split()[j]

    print("")
    print(confusion)

    print("")
    print("Accuracy: %s" % p(calc_accuracy(confusion)))

    for i in range(class_count):
        print("")
        print(classes[i])
        print("Precision: %s" % p(calc_precision(confusion, i)))
        print("Recall: %s" % p(calc_recall(confusion, i)))
        print("F1: %s" % p(calc_f1(confusion, i)))

    print("")
    print("Macro average")
    print("Precision: %s" % p(calc_macro_avg(confusion, calc_precision)))
    print("Recall: %s" % p(calc_macro_avg(confusion, calc_recall)))
    print("F1: %s" % p(calc_macro_avg(confusion, calc_f1)))


if __name__ == "__main__":
    main()