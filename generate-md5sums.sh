#!/bin/bash
for dir in releases/magento-1*;
do
	base=$(basename $dir)
	md5file=$(echo $base | sed -e 's/magento-/magento-CE-/')
	test -e md5sums/$md5file && continue
	echo Processing $base to $md5file
	cd releases/$base
	find {js,media,skin} -type f -exec md5sum "{}" \; > ../../md5sums/$md5file
	cd ../..
done
