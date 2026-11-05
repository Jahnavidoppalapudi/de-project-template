from src.utils import normalize_column_name


def test_normalize_column_name():
    assert normalize_column_name("Pickup DateTime") == "pickup_datetime"
    assert normalize_column_name("  Fare-Amount ") == "fare_amount"
