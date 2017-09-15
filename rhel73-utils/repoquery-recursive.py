#!/usr/bin/python3
import sys
import subprocess

repoquery = [
	'repoquery', '--plugins', '-R', '--resolve',
	'--qf', '%{name}.%{arch} %{repoid} %{location}']

repoquery_self = [
	'repoquery', '--plugins', '--resolve',
	'--qf', '%{name}.%{arch} %{repoid} %{location}']


package_info = dict()


def check_dep(packages):	
	#print(packages)
	if len(packages) == 0:
		return
	cmd = repoquery + packages
	output = subprocess.check_output(cmd).decode("utf-8")
	wait_for_checking = []
	for line in output.split('\n'):
		if len(line) == 0:
			continue
		(package_name, repoid, location) = line.split(' ')
		if (repoid != 'InstallMedia' and 
				package_name not in package_info):
			package_info[package_name] = (repoid, location)
			wait_for_checking.append(package_name)
	check_dep(wait_for_checking)


check_dep(sys.argv[1:])
cmd = repoquery_self + sys.argv[1:]
output = subprocess.check_output(cmd).decode("utf-8")
wait_for_checking = []
for line in output.split('\n'):
	if len(line) == 0:
		continue
	(package_name, repoid, location) = line.split(' ')
	if (repoid != 'InstallMedia' and 
			package_name not in package_info):
		package_info[package_name] = (repoid, location)

for package in package_info:
	print(package_info[package][1])
