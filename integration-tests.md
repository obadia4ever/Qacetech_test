## Integration Tests for Cats Sinatra App

### Prerequisites:
- App must be accessible (e.g., via LoadBalancer or port-forward)
- `curl` or any HTTP client available

### Basic Health and Functionality Tests:
```bash
# Health check (assuming / returns 200)
curl -s -o /dev/null -w "%{http_code}\n" http://<APP_URL>/ | grep 200

# Check HTML response content
curl -s http://<APP_URL>/ | grep -i "cats"

# Load test (optional)
ab -n 50 -c 5 http://<APP_URL>/
```

You may also integrate these tests in Jenkins as a post-deploy step.
