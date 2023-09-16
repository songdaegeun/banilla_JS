using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class test : MonoBehaviour
{
    public float rotationSpeed;
    public float Speed;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        this.transform.Rotate(Vector3.up, 0.5f*Time.deltaTime * rotationSpeed);
        this.transform.position = this.transform.position + Vector3.up*Speed*Time.deltaTime;
    }
}
 