# How to Use

## Server

```docker-compose up -d```

## Client

1. Add host registry.demo.com into /etc/hosts  
   ```echo REGISTRY_IP registry.demo.com >> /etc/hosts```

2. Modify daemon config  
   ```bash deploy.sh```

3. Login  
   ```docker login -u username -p password registry.demo.com:5000```
