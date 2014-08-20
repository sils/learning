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
        n = len(original)
        return (1 / n) * math.exp(-pow((i - j) / (self.sigma * n), 2))

    def _a(self):
        n = len(original)
        a = numpy.zeros((n, n), dtype=float)


if __name__ == "__main__":
    original = get_input()
    sigma = input("Choose sigma:")
    conv = Convoluter(int(sigma), original)
    convoluted = conv.convolute_with_integral()

    plt.plot(original)
    plt.plot(convoluted)
    plt.show()
