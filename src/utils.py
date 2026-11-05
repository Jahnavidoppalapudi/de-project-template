"""Shared helper functions."""


def normalize_column_name(name: str) -> str:
    """Convert a column name to snake_case, e.g. 'Pickup DateTime' -> 'pickup_datetime'."""
    return "_".join(name.strip().lower().replace("-", " ").split())
