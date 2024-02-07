using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI; 

public class TrashcanText : MonoBehaviour
{
    public GameObject UiObject;
    public GameObject cube;
    void Start()
    {
        UiObject.SetActive(false);
    }
    private void OnTriggerEnter(Collider other)
    {
        if (other.tag == "Player")
        {
            Debug.Log("AAAAAAAAAAAAAAAA");
            UiObject.SetActive(true);
        }
    }
    // Update is called once per frame
    void Update()
    {
        
    }
    void OnTriggerExit(Collider other)
    {
        UiObject?.SetActive(false);
        Destroy(cube);
    }
}
