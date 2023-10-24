images=(web cache db)
for image in images
do
    docker save ${image} > ${image}.tar
    #scp ${image}.tar $yourhost:
    #ssh $yourhost docker load ${image}.tar
done