#! /bin/env python3
import sys
import termios
import tty
import time


def get_single_char():
    """Liest ein einzelnes Zeichen direkt vom Terminal ein."""
    fd = sys.stdin.fileno()
    old_settings = termios.tcgetattr(fd)
    try:
        tty.setraw(sys.stdin.fileno())
        ch = sys.stdin.read(1)
    finally:
        termios.tcsetattr(fd, termios.TCSADRAIN, old_settings)
    return ch


def run_typing_test():
    target_length = 100
    user_input = ""

    print(f"Bitte tippen Sie so schnell wie möglich {target_length} Zeichen.")
    print("Wir messen dann Ihre WPM (Words Per Minute).\n")
    print("-" * 30)

    # Startzeitpunkt setzen
    start_time = time.time()

    while len(user_input) < target_length:
        char = get_single_char()

        # Enter/Return beendet die Eingabe vorzeitig
        if char in ('\r', '\n'):
            break

        # Backspace/Delete Handling (ASCII 127 oder 8)
        if char in ('\x7f', '\x08'):
            if len(user_input) > 0:
                user_input = user_input[:-1]
                # Cursor zurück, Leerzeichen schreiben (löschen), Cursor zurück
                sys.stdout.write('\b \b')
                sys.stdout.flush()
            continue

        # Nur druckbare Zeichen hinzufügen
        if char.isprintable():
            user_input += char
            sys.stdout.write(char)
            sys.stdout.flush()

    end_time = time.time()
    elapsed = end_time - start_time

    # Berechnungen
    if elapsed > 0:
        cpm = (len(user_input) / elapsed) * 60
        wpm = cpm / 5
    else:
        cpm = wpm = 0

    print(f"\n\n{'-' * 30}")
    print(f"Eingabe beendet.")
    print(f"Dauer: {elapsed:.2f} Sekunden")
    print(f"Zeichen pro Minute (CPM): {cpm:.2f}")
    print(f"Wörter pro Minute (WPM): {wpm:.2f}")


if __name__ == "__main__":
    try:
        run_typing_test()
    except KeyboardInterrupt:
        print("\nAbgebrochen.")
        sys.exit()
