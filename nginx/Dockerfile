FROM nginx
RUN echo 'fastcgi_split_path_info ^(.+\.php)(/.+)$;\nfastcgi_index index.php;\ninclude fastcgi_params;\nfastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;\nfastcgi_param PATH_INFO $fastcgi_path_info;\n' >> /etc/nginx/php_params
RUN echo 'include php_params;\nfastcgi_pass php74_farm;\n' >> /etc/nginx/php74_params