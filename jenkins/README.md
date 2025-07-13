# Jenkins

The CI was implemented with Jenkins (maybe we will change it to GitHub Action
in the future).

## The Pipeline

The Jenkins server must have docker installation in it.

In our case, the Jenkins server didn't have docker-compose and pytest, so we
created a test container which execute the test with pytest.

```mermaid
graph TD
;
    a[Cleanup Previous Runs] --> b[Checkout SCM]
    b --> c[Create Docker Network]
    c --> d[Build Images in parallel]
    d --> e[Run Application Container]
    e --> f[Run Test Container]
    f --> g[Push Image to Docker Hub]
```

The post build cleans up all the docker resources (containers and network).
