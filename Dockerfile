ARG base_image
FROM $base_image

ARG config_path
ADD $config_path/spark-defaults.conf conf/

ADD requirements.txt .
RUN pip install --quiet -r requirements.txt

RUN echo 'c.NotebookApp.contents_manager_class = "notedown.NotedownContentsManager"' >> ~/.jupyter/jupyter_notebook_config.py

# NbEtensions
RUN python -m pip install --quiet --upgrade jupyterthemes
RUN python -m pip install --quiet jupyter_contrib_nbextensions
RUN jupyter contrib nbextension install --user
RUN jupyter nbextension enable contrib_nbextensions_help_item/main
RUN jupyter nbextension enable autosavetime/main
RUN jupyter nbextension enable freeze/main
RUN jupyter nbextension enable execute_time/ExecuteTime 
RUN jupyter nbextension enable toc2/main

CMD ./config/run.sh

