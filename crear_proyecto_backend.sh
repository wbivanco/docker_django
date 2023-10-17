crear_directorio_trabajo(){    
    cd ..
    mkdir proyecto/
    cd proyecto
    mkdir $1    
}

crear_activar_entorno_virtual(){       
    python -m venv entvirt
    source entvirt/bin/activate
}

copiar_archivos(){        
    cd ..
    cp docker_django/env docker_django/gitignore docker_django/dockerignore proyecto/$1
    cp -r docker_django/requirements/ proyecto/$1/requirements
}

instalar_iniciar_proyecto(){    
    cd proyecto/$1
    pip install -r ../requirements/development.txt    
    python -m pip install --upgrade pip    
    django-admin startproject config .
}

ocultar_archivos(){    
    mv env .env
    mv gitignore .gitignore
    mv dockerignore .dockerignore
}

iniciar_repo_local(){
    git init .
    git add .
    git commit -m "Primer commit con el proyecto inicial"
}

copiar_archivos_docker_directorio_trabajo(){    
    cp ../../docker_django/Dockerfile ../../docker_django/docker-compose.yml .   
}

levantar_docker(){
    docker-compose up
}


crear_directorio_trabajo $1
crear_activar_entorno_virtual 
copiar_archivos $1
instalar_iniciar_proyecto $1
ocultar_archivos
iniciar_repo_local
# Copiar los archivos de Docker luego del primer commit(porque gitignore no es oculto aun)
copiar_archivos_docker_directorio_trabajo $1
levantar_docker