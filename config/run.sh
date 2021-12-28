#!/bin/bash

python setup.py -q develop

if [ -n "$JUPYTER_THEME" ]; then
  jt -t $JUPYTER_THEME
fi

jupyter notebook --ip=127.0.0.1 \
                 --port=8888 --allow-root \
                #  --NotebookApp.notebook_dir='../notebooks' \
                 --NotebookApp.token='' \
                 --NotebookApp.password=''
