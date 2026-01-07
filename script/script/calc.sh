#!/usr/bin/env python3
import sys
import re
from decimal import Decimal, ROUND_HALF_UP

# Input holen (Args oder stdin)
expr = " ".join(sys.argv[1:]) or sys.stdin.read().strip()

# Slack / Unicode normalisieren
expr = (
    expr.replace("–", "-")
    .replace("—", "-")
    .replace("−", "-")
    .replace("×", "*")
    .replace("÷", "/")
    .replace("\u00a0", " ")
)

# Nur erlaubte Zeichen behalten
expr = re.sub(r"[^0-9+\-*/()., ]", "", expr)

# Dezimalkomma → Punkt
expr = expr.replace(",", ".")

# Ausdruck auswerten (stark eingeschränkt)
result = eval(expr, {"__builtins__": None}, {})

# Auf 2 Nachkommastellen runden
d = Decimal(str(result)).quantize(Decimal("0.00"), rounding=ROUND_HALF_UP)

# Unnötige Nachkommastellen entfernen
out = format(d.normalize(), "f")

# Punkt → Komma
print(out.replace(".", ","))

