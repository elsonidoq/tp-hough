from pylab import *
from scipy.io import loadmat
import sys

def main():
    fname = sys.argv[1]
    d = loadmat(fname)
    A = d['A'].squeeze()
    ts = d['ts'].squeeze()
    rs = d['rs'].squeeze()

    A = A.T
    A = map(lambda x:[int(e) for e in x], A)
    A = sorted(A, key=lambda x:-max(x))
    A = A[:100]
    for i in xrange(len(A)):
        plot(rs, A[i], '-b', alpha=0.3)
    for factor in [0.7, 0.8, 0.9, 1]:
        label = '%s%% perimeter' % int(factor*100)
        plot(rs, factor*ts, '--', label=label)
    legend(loc='best')
    xlabel('Radio')
    ylabel('Acumulador')
    show()

if __name__ == '__main__': main()
