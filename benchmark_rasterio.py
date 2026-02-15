import rasterio
import time
with open("s2_shared_path.txt", "r") as f:
    s2_path = f.read().strip()
t0 = time.perf_counter()
with rasterio.open(s2_path) as src:
    res = src.read(1) * 1.5
    m = res.mean()
t_final = time.perf_counter() - t0
print(f"🐍 Python: {t_final:.3f} seg | mean = {m:.6f}")