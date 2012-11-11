all: cangjie.cpp
	g++ -shared -pthread -fPIC -fwrapv -O2 -Wall -fno-strict-aliasing -I/usr/include/python2.7 -I /usr/include/cangjie -lcangjie -o cangjie.so cangjie.cpp

cangjie.cpp: cangjie.pyx cangjie.pxd clean
	cython --cplus --verbose cangjie.pyx

clean:
	rm -f *.cpp
	rm -f *.so
