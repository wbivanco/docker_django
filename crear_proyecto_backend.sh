crear_directorio_trabajo(){    
    cd ..
    mkdir proyecto/
    cd proyecto
    mkdir $1    
    echo "----- Paso 1 -----"
}

crear_activar_entorno_virtual(){       
    python -m venv entvirt
    source entvirt/bin/activate
    echo "----- Paso 2 -----"
}

copiar_archivos(){        
    cd ..
    cp docker_django/env docker_django/gitignore docker_django/dockerignore proyecto/$1
    cp -r docker_django/requirements/ proyecto/$1/requirements    
    echo "----- Paso 3 -----"
    pwd
}

instalar_iniciar_proyecto(){    
    cd proyecto/$1
    pip install -r requirements/development.txt    
    python -m pip install --upgrade pip    
    django-admin startproject config .
    echo "----- Paso 4 -----"
}

ocultar_archivos(){    
    mv env .env
    mv gitignore .gitignore
    mv dockerignore .dockerignore
    echo "----- Paso 5 -----"
}

iniciar_repo_local(){
    git init .
    git add .
    git commit -m "Primer commit con el proyecto inicial"
    echo "----- Paso 6 -----"
}

copiar_archivos_docker_directorio_trabajo(){    
    cp ../../docker_django/Dockerfile ../../docker_django/docker-compose.yml .   
    cp -r ../../docker_django/conf/ conf
    echo "----- Paso 7 -----"
}

levantar_docker(){
    docker-compose up
    echo "----- Paso 8 -----"
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