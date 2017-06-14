def uc1(numin, frm, to):
    '''sympy
    uc1 - unit convert 1
    http://docs.sympy.org/dev/modules/physics/units.html
    # uses sympy module for unit conversion(uc)
    # converts number 'num' from 'frm' units to 'to' units

    # examples
    uc1(1.0,'pascal','psi')
    uc1(1.0,'psi','kPa')
    uc1(1.0,'atm','psi')
    uc1(1.0,'inch','mm')
    uc1(1.0,'kilometer','mile')
    uc1(1.0,'mile','kilometer')
    uc1(1.0,'newton','pound')
    uc1(1.0,'pound','newton')
    uc1(1.0,'joule','calorie')
    uc1(1.0, 'radians','degrees')


    '''
    from sympy.physics import units

    try:
        eval('units.' + frm)
    except:
        print('no unit %s found, did you mean...\n' % frm)
        print(eval("units.find_unit('" + frm + "')"))
        return

    try:
        eval('units.' + to)
    except:
        print('no unit %s found, did you mean...\n' % to)
        print(eval("units.find_unit('" + to + "')"))
        return

    strin = 'numin * units.' + frm + '/units.' + to
    numout = float(eval(strin))
    # print(numin , frm , '=' , numout , to)
    print('%.2f %s = %.2f  %s ' % (numin, frm, numout, to))
    # return numout


def uc2(num, frm, to):
    ''' Pint
    uc2 - unit convert 2
    Pint is used to manipulate physical quanities
    https://pint.readthedocs.org/en/0.6/tutorial.html

    # uses pint module for unit conversion
    # converts number 'num' from 'frm' units to 'to' units
    uc2(17.5,'lbf','newton')
    uc2(1,'lbf','newton')
    uc2(300,'pascal','psi')
    uc2(1,'inch','mm')
    uc2(1,'kilometer','mile')
    uc2(1,'mile','kilometer')
    '''
    try:
        from pint import UnitRegistry
    except:
        print('pint is missing, install with $ pip install pint')
    ureg = UnitRegistry()
    strin = 'num * ureg.' + frm + '.to(ureg.' + to + ')'
    numout = eval(strin)
    print(num, frm, '=', numout)
    return numout


def uc3(numin, frm, to):
    '''quantities
    uc3 - unit convert 3
    https://github.com/python-quantities/python-quantities
    https://pythonhosted.org/quantities/user/tutorial.html

    c3(1,'inch','ft')

    inch, ft, m, mil, mile, fathom, light_year, mm,
    Celsius, Fahrenheit, kelvin
    pascal, psi
    calorie, joule
    watt, horsepower

    '''
    try:
        import quantities as pq
    except:
        print('python-quantities not found, downloading and installing from github now...')
        import os
        os.system('pip install git+https://github.com/python-quantities/python-quantities.git')

    try:
        eval('pq.' + frm)
        eval('pq.' + to)
    except:
        print('no unit found')
        return

    numout = eval(str(numin) + "* pq." + frm)
    numout.units = to
    numout = float(numout)

    # print(numin , frm , '=' , numout , to)
    print('%.2f %s = %.2f  %s ' % (numin, frm, numout, to))
    # return numout


def in_mm(n=16):
    # %pylab inline # command in ipython that imports sci modulues
    import sympy as sym
    sym.init_printing()
    for k in range(n + 1):
        n = float(n)
        print(' %5s in - %.6f in - %.6f mm ' % (sym.Rational(k, n), k / n, 25.4 * k / n))


def nas(n=16):
    # %pylab inline # command in ipython that imports sci modulues
    import sympy as sym
    sym.init_printing()
    for k in range(n + 1):
        n = float(n)
        print('NAS63%02d = %s' % (k, sym.Rational(k, n)))


def hst(n=16):
    # %pylab inline # command in ipython that imports sci modulues
    import sympy as sym
    sym.init_printing()
    for k in range(n + 1):
        n = float(n)
        print('HST63%02d = %s' % (k, sym.Rational(k, n * 2)))


if __name__ == '__main__':
    # executed when script is run alone
    import sys

    if sys.argv[1] == 'in_mm':
        in_mm()
    else:
        numin = float(sys.argv[1])
        frm = sys.argv[2]
        to = sys.argv[3]

        uc3(numin, frm, to)

