FROM python:3.9-alpine3.13
LABEL maintainer="shabaz"

ENV PYTHONBUFFERED 1
COPY ./requirements.txt /temp/requirements.txt
COPY ./requirements.dev.txt /temp/requirements.dev.txt

COPY ./app /app
EXPOSE 8000

ARG DEV=false

RUN pip install --upgrade pip && pip install -r /temp/requirements.txt 
RUN if [$DEV = "true" ]; then pip install -r /temp/requirements.dev.txt ; fi


# Clean up
RUN rm -rf /tmp

# Add a non-root user
RUN adduser --disabled-password --no-create-home django-user

# RUN python -m venv /&& \
#     /py/bin/pip install --upgrade pip && \
#     /py/bin/pip install -r /temp/requirements.txt && \
#     rm -rf/tmp && \
#     adduser \
#         --disabled-password \
#         --no-create-home \
#         django-user

ENV PATH="/py/bin:$PATH"

USER django-user
# CMD ["sh", "-c", "python manage.py runserver 0.0.0.0:8000"]