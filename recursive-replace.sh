egrep -lRZ 'foo' . | xargs -0 -l sed -i -e 's/foo/bar/g'

