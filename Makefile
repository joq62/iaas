all:
#	service
	rm -rf ebin/*;
#	interfaces
	erlc -I ../../interfaces -o ebin ../../interfaces/*.erl;
#	iaas
	erlc -I ../../interfaces -o ebin ../../kube_iaas/src/*.erl;
#	node
	erlc -I ../../interfaces -o ebin ../../support/src/*.erl;
#	application
	cp src/*.app ebin;
	erlc -o ebin src/*.erl;
	rm -rf src/*.beam *.beam  test_src/*.beam test_ebin;
	rm -rf  *~ */*~  erl_cra*;
	echo Done
