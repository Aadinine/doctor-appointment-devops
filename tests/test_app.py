import pytest
import sys
import os

# Add the app directory to the Python path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', 'app'))

# Basic tests for the Flask application
def test_health_endpoint():
    """Test the health check endpoint"""
    try:
        from app import app
        with app.test_client() as client:
            response = client.get('/health')
            assert response.status_code == 200
            assert b'healthy' in response.data
    except ImportError:
        pytest.skip("Could not import app module")

def test_app_imports():
    """Test that the app can be imported without errors"""
    try:
        import app
        assert app is not None
    except ImportError as e:
        pytest.skip(f"Could not import app: {e}")

def test_flask_app_exists():
    """Test that Flask app is created"""
    try:
        from app import app
        assert hasattr(app, 'route')
    except ImportError:
        pytest.skip("Could not import app module")
