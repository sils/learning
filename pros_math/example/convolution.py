#!/usr/bin/python3
"""
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.
"""
import math
from input import get_input
import matplotlib.pyplot as plt
import numpy


class Convoluter:
    def __init__(self, sigma, original=[]):
        self.sigma = sigma
        self.original = original

    def _h(self, t, s):
        return math.exp(-pow((s - t) / self.sigma, 2))

    def _integrate(self, start, end, s):
        res = 0
        for t in range(start, end):
            res += self._h(t, s) * self.original[t]

        return res

    def convolute_with_integral(self):
        """
        :param s: the point to evaluate
        :return: returns the convoluted signal at the point to evaluate
        """
        res = []
        for s in range(0, len(self.original)):
            res.append(self._integrate(0, len(self.original), s))

        return res


class Discretizer(Convoluter):
    def __init__(self, sigma, original=[]):
        Convoluter.__init__(self, sigma, original)

    def _aij(self, i, j):
        return self._h(i, j)
        #n = len(original)
        #return (1 / n) * math.exp(-((i - j)*(i - j) / ((self.sigma * n)*(self.sigma * n))))

    def _a(self):
        n = len(original)
        a = numpy.zeros((n, n), dtype=float)

        for i in range(0, len(original)):
            for j in range(0, len(original)):
                a[i][j] = self._aij(i,j)

        return numpy.matrix(a)

    def convolute_with_matrix(self):
        matrix = self._a()
        vec = matrix * numpy.array(original, ndmin=2).transpose()
        lst = numpy.asarray(vec).transpose()[0]
        self.randomize(lst)
        return lst

    def randomize(self, lst):
        off = 0 #numpy.random.random() - 0.5
        for i in range(0, len(lst)):
            lst[i] += (numpy.random.random()-0.5)*0.000009 + off

    def deconvolute(self, convoluted):
        matrix = self._a().I
        return numpy.asarray(matrix * numpy.array(convoluted, ndmin=2).transpose()).transpose()[0]




if __name__ == "__main__":
    original = get_input()
    sigma = 3
    disc = Discretizer(int(sigma), original)
    convoluted = disc.convolute_with_integral()
    convoluted2 = disc.convolute_with_matrix()

    plt.plot(original)
    plt.plot(convoluted)
    plt.plot(convoluted2)
    plt.plot(disc.deconvolute(convoluted2))
    plt.show()
